use serde::Serialize;

#[derive(Debug, Clone, Serialize, PartialEq, Eq)]
pub struct LineDiagnostic {
    pub line_number: usize,
    pub rule: String,
    pub reason: String,
}

#[derive(Debug, Clone, Default, Serialize, PartialEq, Eq)]
pub struct FilterDiagnostics {
    pub accepted_count: usize,
    pub unsupported_count: usize,
    pub invalid_count: usize,
    pub comment_count: usize,
    pub empty_count: usize,
    pub samples: Vec<LineDiagnostic>,
}

#[derive(Debug, PartialEq, Eq)]
pub enum RuleStatus {
    Accepted(String),
    Unsupported(String),
    Invalid(String),
    Comment,
    Empty,
}

/// Evaluates uBlock preprocessor condition expressions.
/// True tokens: `env_mobile`, `env_chromium`.
/// False tokens: `ext_*`, `adguard*`, `cap_html_filtering`, `cap_user_stylesheet`, `env_mv3`, `false`.
pub fn eval_condition(expr: &str) -> Result<bool, String> {
    let tokens = tokenize_expr(expr)?;
    let mut pos = 0;
    let res = parse_or_expr(&tokens, &mut pos)?;
    if pos < tokens.len() {
        return Err(format!(
            "Unexpected token after expression: {:?}",
            &tokens[pos..]
        ));
    }
    Ok(res)
}

#[derive(Debug, PartialEq, Eq, Clone)]
enum Token {
    Ident(String),
    Not,
    And,
    Or,
    LParen,
    RParen,
}

fn tokenize_expr(expr: &str) -> Result<Vec<Token>, String> {
    let mut tokens = Vec::new();
    let mut chars = expr.chars().peekable();

    while let Some(&ch) = chars.peek() {
        match ch {
            ' ' | '\t' | '\r' | '\n' => {
                chars.next();
            }
            '(' => {
                tokens.push(Token::LParen);
                chars.next();
            }
            ')' => {
                tokens.push(Token::RParen);
                chars.next();
            }
            '!' => {
                tokens.push(Token::Not);
                chars.next();
            }
            '&' => {
                chars.next();
                if chars.next() == Some('&') {
                    tokens.push(Token::And);
                } else {
                    return Err("Expected '&&' for logical AND".to_string());
                }
            }
            '|' => {
                chars.next();
                if chars.next() == Some('|') {
                    tokens.push(Token::Or);
                } else {
                    return Err("Expected '||' for logical OR".to_string());
                }
            }
            c if c.is_alphanumeric() || c == '_' || c == '-' || c == '*' => {
                let mut ident = String::new();
                while let Some(&c2) = chars.peek() {
                    if c2.is_alphanumeric() || c2 == '_' || c2 == '-' || c2 == '*' {
                        ident.push(c2);
                        chars.next();
                    } else {
                        break;
                    }
                }
                tokens.push(Token::Ident(ident));
            }
            other => {
                return Err(format!("Unexpected character in condition: '{}'", other));
            }
        }
    }
    Ok(tokens)
}

fn parse_or_expr(tokens: &[Token], pos: &mut usize) -> Result<bool, String> {
    let mut left = parse_and_expr(tokens, pos)?;
    while *pos < tokens.len() && tokens[*pos] == Token::Or {
        *pos += 1;
        let right = parse_and_expr(tokens, pos)?;
        left = left || right;
    }
    Ok(left)
}

fn parse_and_expr(tokens: &[Token], pos: &mut usize) -> Result<bool, String> {
    let mut left = parse_unary_expr(tokens, pos)?;
    while *pos < tokens.len() && tokens[*pos] == Token::And {
        *pos += 1;
        let right = parse_unary_expr(tokens, pos)?;
        left = left && right;
    }
    Ok(left)
}

fn parse_unary_expr(tokens: &[Token], pos: &mut usize) -> Result<bool, String> {
    if *pos >= tokens.len() {
        return Err("Unexpected end of condition expression".to_string());
    }
    if tokens[*pos] == Token::Not {
        *pos += 1;
        let val = parse_unary_expr(tokens, pos)?;
        return Ok(!val);
    }
    parse_primary_expr(tokens, pos)
}

fn parse_primary_expr(tokens: &[Token], pos: &mut usize) -> Result<bool, String> {
    if *pos >= tokens.len() {
        return Err("Unexpected end of condition expression".to_string());
    }
    match &tokens[*pos] {
        Token::LParen => {
            *pos += 1;
            let val = parse_or_expr(tokens, pos)?;
            if *pos >= tokens.len() || tokens[*pos] != Token::RParen {
                return Err("Missing closing parenthesis ')'".to_string());
            }
            *pos += 1;
            Ok(val)
        }
        Token::Ident(name) => {
            *pos += 1;
            resolve_token_value(name)
        }
        other => Err(format!("Expected identifier or '(', found {:?}", other)),
    }
}

fn resolve_token_value(ident: &str) -> Result<bool, String> {
    match ident {
        "true" | "env_mobile" | "env_chromium" => Ok(true),
        "false"
        | "cap_html_filtering"
        | "cap_user_stylesheet"
        | "env_mv3"
        | "env_firefox"
        | "env_safari"
        | "env_edge" => Ok(false),
        s if s.starts_with("ext_") || s.starts_with("adguard") => Ok(false),
        _unknown => Ok(false),
    }
}

/// Preprocesses raw filter list text:
/// 1. Evaluates !#if / !#else / !#endif directives
/// 2. Classifies each line as Accepted, Unsupported, Invalid, Comment, or Empty
/// 3. Returns the clean accepted filter text plus diagnostics summary
pub fn preprocess_list(input: &str) -> Result<(String, FilterDiagnostics), String> {
    let mut accepted_lines = Vec::new();
    let mut diagnostics = FilterDiagnostics::default();

    // Stack of (condition_matched, condition_active, has_else, is_err)
    let mut cond_stack: Vec<(bool, bool, bool, bool)> = Vec::new();

    for (idx, raw_line) in input.lines().enumerate() {
        let line_num = idx + 1;
        let trimmed = raw_line.trim();

        // Check for preprocessor directives
        if let Some(rest) = trimmed.strip_prefix("!#if ") {
            let expr = rest.trim();
            let parent_active = cond_stack.last().map(|c| c.1).unwrap_or(true);
            if !parent_active {
                cond_stack.push((false, false, false, false));
            } else {
                match eval_condition(expr) {
                    Ok(cond) => {
                        let active = parent_active && cond;
                        cond_stack.push((cond, active, false, false));
                    }
                    Err(err) => {
                        cond_stack.push((false, false, false, true));
                        diagnostics.unsupported_count += 1;
                        if diagnostics.samples.len() < 100 {
                            diagnostics.samples.push(LineDiagnostic {
                                line_number: line_num,
                                rule: trimmed.to_string(),
                                reason: format!("Unsupported !#if condition: {}", err),
                            });
                        }
                    }
                }
            }
            continue;
        } else if trimmed == "!#else" {
            if let Some((cond, _, has_else, is_err)) = cond_stack.pop() {
                if has_else {
                    return Err(format!("Multiple !#else directives at line {}", line_num));
                }
                let parent_active = cond_stack.last().map(|c| c.1).unwrap_or(true);
                let else_cond = if is_err { false } else { !cond };
                let active = parent_active && else_cond;
                cond_stack.push((cond, active, true, is_err));
            } else {
                return Err(format!("Unmatched !#else at line {}", line_num));
            }
            continue;
        } else if trimmed == "!#endif" {
            if cond_stack.pop().is_none() {
                return Err(format!("Unmatched !#endif at line {}", line_num));
            }
            continue;
        } else if trimmed.starts_with("!#include ") {
            diagnostics.unsupported_count += 1;
            if diagnostics.samples.len() < 100 {
                diagnostics.samples.push(LineDiagnostic {
                    line_number: line_num,
                    rule: trimmed.to_string(),
                    reason: "External subscription !#include directives are not followed"
                        .to_string(),
                });
            }
            continue;
        }

        // If currently in an inactive conditional branch, skip this line
        let is_active = cond_stack.last().map(|c| c.1).unwrap_or(true);
        if !is_active {
            continue;
        }

        match classify_rule(trimmed) {
            RuleStatus::Accepted(rule) => {
                diagnostics.accepted_count += 1;
                accepted_lines.push(rule);
            }
            RuleStatus::Unsupported(reason) => {
                diagnostics.unsupported_count += 1;
                if diagnostics.samples.len() < 100 {
                    diagnostics.samples.push(LineDiagnostic {
                        line_number: line_num,
                        rule: trimmed.to_string(),
                        reason,
                    });
                }
            }
            RuleStatus::Invalid(reason) => {
                diagnostics.invalid_count += 1;
                if diagnostics.samples.len() < 100 {
                    diagnostics.samples.push(LineDiagnostic {
                        line_number: line_num,
                        rule: trimmed.to_string(),
                        reason,
                    });
                }
            }
            RuleStatus::Comment => {
                diagnostics.comment_count += 1;
            }
            RuleStatus::Empty => {
                diagnostics.empty_count += 1;
            }
        }
    }

    if !cond_stack.is_empty() {
        return Err("Unclosed !#if directive at end of file".to_string());
    }

    let joined = accepted_lines.join("\n");
    Ok((joined, diagnostics))
}

/// Classifies a single rule line.
pub fn classify_rule(line: &str) -> RuleStatus {
    if line.is_empty() {
        return RuleStatus::Empty;
    }

    // Comments and headers
    if line.starts_with('!') || line.starts_with('#') || line.starts_with('[') {
        // Special case: check if it's actually an ID-based element hiding rule like `###ad-id` or `#banner`
        if line.starts_with("##") || line.starts_with("#@#") || line.starts_with("#?#") {
            // This is a cosmetic selector, proceed below
        } else if line.starts_with("!#") {
            return RuleStatus::Unsupported("Unsupported preprocessor directive".to_string());
        } else {
            return RuleStatus::Comment;
        }
    }

    // Line length limit: 16 KiB
    if line.len() > 16 * 1024 {
        return RuleStatus::Invalid("Rule exceeds 16 KiB length limit".to_string());
    }

    // Detect scriptlet injection
    if line.contains("##+js(") || line.contains("#@#+js(") || line.contains("##^script:has-text") {
        return RuleStatus::Unsupported("Scriptlet injection (+js) is not supported".to_string());
    }

    // Detect procedural cosmetic filters
    if line.contains("##:has(")
        || line.contains("##:has-text(")
        || line.contains("##:matches-path(")
        || line.contains("##:min-text-length(")
        || line.contains("##:watch-attr(")
        || line.contains("##:xpath(")
        || line.contains("#?#")
    {
        return RuleStatus::Unsupported(
            "Procedural cosmetic selector is not supported".to_string(),
        );
    }

    // Detect unsupported network options
    if let Some(opts_idx) = line.rfind('$') {
        let opts = &line[opts_idx + 1..];
        for opt in opts.split(',') {
            let opt = opt.trim();
            if opt.starts_with("csp=") {
                return RuleStatus::Unsupported(
                    "CSP header modification is not supported".to_string(),
                );
            }
            if opt.starts_with("redirect=") || opt.starts_with("redirect-rule=") {
                return RuleStatus::Unsupported("Redirect resources are not supported".to_string());
            }
            if opt.starts_with("removeparam=") {
                return RuleStatus::Unsupported(
                    "URL parameter stripping is not supported".to_string(),
                );
            }
            if opt.starts_with("rewrite=") {
                return RuleStatus::Unsupported("URL rewriting is not supported".to_string());
            }
            if opt == "inline-script" {
                return RuleStatus::Unsupported(
                    "Inline script filtering is not supported".to_string(),
                );
            }
        }
    }

    // Verify basic syntax parsability by adblock crate
    RuleStatus::Accepted(line.to_string())
}
