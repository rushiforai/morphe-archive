use crate::engine_wrapper::EngineWrapper;
use crate::preprocessor::{eval_condition, preprocess_list};
use std::sync::Arc;
use std::thread;

#[test]
fn test_url_anchors_and_separators() {
    let rules = "||doubleclick.net^\n|https://adservice.google.com/|\n/tracking-pixel.gif|\n";
    let engine = EngineWrapper::from_rules(rules).unwrap();

    // Anchor || match
    assert_eq!(
        engine.match_request(
            "https://securepubads.g.doubleclick.net/gampad/ads",
            "https://www.nhl.com/news/article",
            "script",
            "GET"
        ),
        1
    );

    // Exact pipe | anchor match
    assert_eq!(
        engine.match_request(
            "https://adservice.google.com/",
            "https://www.nhl.com/news/article",
            "other",
            "GET"
        ),
        1
    );

    // Suffix $ match
    assert_eq!(
        engine.match_request(
            "https://example.com/assets/tracking-pixel.gif",
            "https://www.nhl.com/news/article",
            "image",
            "GET"
        ),
        1
    );

    // Unrelated URL must be allowed
    assert_eq!(
        engine.match_request(
            "https://assets.nhle.com/logos/nhl/svg/teams.svg",
            "https://www.nhl.com/news/article",
            "image",
            "GET"
        ),
        0
    );
}

#[test]
fn test_exceptions_and_important_cross_list() {
    let list1 = "||doubleclick.net^\n||example.com/ad$script\n";
    let list2 = "@@||doubleclick.net/allowed^$script\n||example.com/ad$important\n";
    let list3 = "@@||example.com/ad^\n"; // Exception overridden by $important above!

    let combined = format!("{}\n{}\n{}", list1, list2, list3);
    let engine = EngineWrapper::from_rules(&combined).unwrap();

    // Normal doubleclick request -> blocked
    assert_eq!(
        engine.match_request(
            "https://pubads.g.doubleclick.net/ads",
            "https://www.nhl.com/",
            "script",
            "GET"
        ),
        1
    );

    // Exception URL -> allowed
    assert_eq!(
        engine.match_request(
            "https://pubads.g.doubleclick.net/allowed?id=123",
            "https://www.nhl.com/",
            "script",
            "GET"
        ),
        0
    );

    // Important rule on example.com/ad overrides exception
    assert_eq!(
        engine.match_request(
            "https://example.com/ad",
            "https://www.nhl.com/",
            "script",
            "GET"
        ),
        1
    );
}

#[test]
fn test_badfilter_removes_earlier_rule() {
    let list1 = "||analytics.tracker.com^\n";
    let list2 = "||analytics.tracker.com^$badfilter\n";
    let combined = format!("{}\n{}", list1, list2);
    let engine = EngineWrapper::from_rules(&combined).unwrap();

    // Due to badfilter, rule is neutralized
    assert_eq!(
        engine.match_request(
            "https://analytics.tracker.com/ping",
            "https://www.nhl.com/",
            "script",
            "GET"
        ),
        0
    );
}

#[test]
fn test_unsupported_rules_classification() {
    let input = r#"
! Shipped test list
||tracker.com^
nhl.com##+js(set, ads, false)
example.com##:has(.banner)
||redirect.com^$redirect=noopjs
||csp.com^$csp=script-src 'none'
||removeparam.com^$removeparam=utm_source
nhl.com##.nhl-o-adv[data-adv-container]
"#;
    let (accepted, diag) = preprocess_list(input).unwrap();
    assert_eq!(diag.accepted_count, 2); // tracker.com and nhl.com##.nhl-o-adv
    assert_eq!(diag.unsupported_count, 5); // +js, :has, redirect, csp, removeparam
    assert!(!accepted.contains("+js"));
    assert!(!accepted.contains(":has"));
    assert!(!accepted.contains("redirect="));
    assert!(!accepted.contains("csp="));
    assert!(!accepted.contains("removeparam="));
}

#[test]
fn test_conditional_directives() {
    // env_mobile is true, cap_user_stylesheet is false
    assert!(eval_condition("env_mobile").unwrap());
    assert!(!eval_condition("cap_user_stylesheet").unwrap());
    assert!(eval_condition("env_mobile && !cap_user_stylesheet").unwrap());
    assert!(eval_condition("(env_chromium || false) && env_mobile").unwrap());
    assert!(eval_condition("ext_ublock").is_ok());
    assert!(!eval_condition("ext_ublock").unwrap());

    // Unknown tokens evaluate to false
    assert_eq!(eval_condition("unknown_feature_xyz"), Ok(false));

    let list = r#"
!#if env_mobile
||mobile-ad.com^
!#else
||desktop-ad.com^
!#endif
!#if cap_html_filtering
||html-filtering.com^
!#endif
"#;
    let (accepted, diag) = preprocess_list(list).unwrap();
    assert!(accepted.contains("mobile-ad.com"));
    assert!(!accepted.contains("desktop-ad.com"));
    assert!(!accepted.contains("html-filtering.com"));
    assert_eq!(diag.accepted_count, 1);
}

#[test]
fn test_unsupported_if_else_directive() {
    // Unknown capability token fallback: evaluates to false, activating the !#else fallback
    let unknown_cap_list = r#"
!#if unknown_feature_xyz
||unsupported-cap.com^
!#else
||fallback-rule.com^
!#endif
"#;
    let (accepted, diag) = preprocess_list(unknown_cap_list).unwrap();
    assert!(!accepted.contains("unsupported-cap.com"));
    assert!(accepted.contains("fallback-rule.com"));
    assert_eq!(diag.unsupported_count, 0);

    // Malformed syntax error (e.g. unclosed paren) keeps both if and else blocks disabled
    let invalid_syntax_list = r#"
!#if (unclosed_paren
||invalid-if.com^
!#else
||invalid-else.com^
!#endif
"#;
    let (accepted_syntax, diag_syntax) = preprocess_list(invalid_syntax_list).unwrap();
    assert!(!accepted_syntax.contains("invalid-if.com"));
    assert!(!accepted_syntax.contains("invalid-else.com"));
    assert_eq!(diag_syntax.accepted_count, 0);
    assert_eq!(diag_syntax.unsupported_count, 1);

    // Inactive parent block skips evaluation of child directives
    let inactive_nested_list = r#"
!#if false
!#if (unclosed_paren
||nested-if.com^
!#else
||nested-else.com^
!#endif
!#endif
"#;
    let (accepted_nested, diag_nested) = preprocess_list(inactive_nested_list).unwrap();
    assert!(!accepted_nested.contains("nested-if.com"));
    assert!(!accepted_nested.contains("nested-else.com"));
    assert_eq!(diag_nested.accepted_count, 0);
    assert_eq!(diag_nested.unsupported_count, 0);
}

#[test]
fn test_cosmetics_and_generic_selectors() {
    let rules = r#"
nhl.com##.nhl-o-adv[data-adv-container]
nhl.com##[data-ad-story-part][data-ad-position]
other.com##.other-ad
##.generic-ad-banner
###generic-ad-id
"#;
    let engine = EngineWrapper::from_rules(rules).unwrap();

    let cosmetics_json = engine
        .cosmetics("https://www.nhl.com/news/article")
        .unwrap();
    assert!(cosmetics_json.contains(".nhl-o-adv[data-adv-container]"));
    assert!(cosmetics_json.contains("[data-ad-story-part][data-ad-position]"));
    assert!(!cosmetics_json.contains(".other-ad"));

    let generic_json = engine
        .generic_selectors(
            "https://www.nhl.com/news/article",
            &[
                "generic-ad-banner".to_string(),
                "normal-content".to_string(),
            ],
            &["generic-ad-id".to_string(), "main-content".to_string()],
        )
        .unwrap();

    assert!(generic_json.contains(".generic-ad-banner"));
    assert!(generic_json.contains("#generic-ad-id"));
    assert!(!generic_json.contains("normal-content"));
}

#[test]
fn test_thread_safety_concurrent_matching() {
    let rules = "||tracker1.com^\n||tracker2.com^\n||tracker3.com^\n";
    let engine = Arc::new(EngineWrapper::from_rules(rules).unwrap());

    let mut handles = Vec::new();
    for thread_id in 0..8 {
        let eng = Arc::clone(&engine);
        handles.push(thread::spawn(move || {
            for i in 0..1000 {
                let url = format!("https://tracker{}.com/ping/{}", (i % 3) + 1, thread_id);
                assert_eq!(
                    eng.match_request(&url, "https://www.nhl.com/article", "script", "GET"),
                    1
                );
            }
        }));
    }

    for h in handles {
        h.join().unwrap();
    }
}
