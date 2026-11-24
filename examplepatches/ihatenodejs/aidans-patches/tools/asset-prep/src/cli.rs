use crate::{AssetError, Result};

pub struct Options<'a> {
    entries: Vec<(&'static str, Option<&'a str>)>,
}

impl<'a> Options<'a> {
    pub fn get(&self, flag: &str) -> Option<&'a str> {
        self.entries.iter().rev().find_map(
            |(name, value)| {
                if *name == flag {
                    *value
                } else {
                    None
                }
            },
        )
    }

    pub fn has(&self, flag: &str) -> bool {
        self.entries.iter().any(|(name, _)| *name == flag)
    }

    pub fn required(&self, flag: &str) -> Result<&'a str> {
        self.get(flag)
            .ok_or_else(|| AssetError::usage(format!("the following argument is required: {flag}")))
    }
}

pub fn parse<'a>(
    args: &'a [String],
    value_flags: &'static [&'static str],
    bool_flags: &'static [&'static str],
) -> Result<Options<'a>> {
    let mut entries = Vec::with_capacity(args.len());
    let mut index = 0;
    while index < args.len() {
        let argument = &args[index];
        let (name, inline) = match argument.split_once('=') {
            Some((name, value)) => (name, Some(value)),
            None => (argument.as_str(), None),
        };
        let canonical = resolve_flag(name, value_flags, bool_flags)?;
        if value_flags.contains(&canonical) {
            let value = match inline {
                Some(value) => value,
                None => {
                    index += 1;
                    args.get(index)
                        .map(String::as_str)
                        .filter(|value| {
                            !value.starts_with('-') || *value == "-" || negative_number(value)
                        })
                        .ok_or_else(|| {
                            AssetError::usage(format!(
                                "argument {canonical}: expected one argument"
                            ))
                        })?
                }
            };
            entries.push((canonical, Some(value)));
        } else {
            if inline.is_some() {
                return Err(AssetError::usage(format!(
                    "argument {canonical}: does not take a value"
                )));
            }
            entries.push((canonical, None));
        }
        index += 1;
    }
    Ok(Options { entries })
}

fn resolve_flag(
    name: &str,
    value_flags: &'static [&'static str],
    bool_flags: &'static [&'static str],
) -> Result<&'static str> {
    let all = value_flags.iter().chain(bool_flags.iter()).copied();
    if let Some(exact) = all.clone().find(|flag| *flag == name) {
        return Ok(exact);
    }
    if name.starts_with("--") && name.len() > 2 {
        let mut matches = all.filter(|flag| flag.starts_with(name));
        if let Some(first) = matches.next() {
            if matches.next().is_none() {
                return Ok(first);
            }
            return Err(AssetError::usage(format!("ambiguous option: {name}")));
        }
    }
    Err(AssetError::usage(format!("unrecognized argument: {name}")))
}

fn negative_number(value: &str) -> bool {
    let Some(number) = value.strip_prefix('-') else {
        return false;
    };
    match number.split_once('.') {
        Some((whole, fraction)) => {
            !fraction.is_empty()
                && whole.bytes().all(|byte| byte.is_ascii_digit())
                && fraction.bytes().all(|byte| byte.is_ascii_digit())
        }
        None => !number.is_empty() && number.bytes().all(|byte| byte.is_ascii_digit()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn duplicate_and_inline_values_keep_the_last_requested_output() {
        let args = ["--out=first", "--output", "-1", "--out=last"].map(str::to_string);
        let options = parse(&args, &["--output"], &[]).unwrap();
        assert_eq!(options.required("--output").unwrap(), "last");
    }

    #[test]
    fn ambiguous_and_missing_values_are_usage_errors() {
        for args in [vec!["--c"], vec!["--cache-dir", "--check-only"]] {
            let args: Vec<_> = args.into_iter().map(str::to_string).collect();
            assert_eq!(
                parse(&args, &["--cache-dir"], &["--check-only"])
                    .err()
                    .unwrap()
                    .exit_code(),
                2
            );
        }
    }
}
