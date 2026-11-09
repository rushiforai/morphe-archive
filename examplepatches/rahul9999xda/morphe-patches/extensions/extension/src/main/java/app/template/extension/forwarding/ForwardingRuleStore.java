package app.template.extension.forwarding;

import java.util.List;

/** Persistence boundary. Implement with app-private storage once the runtime extension is wired. */
public interface ForwardingRuleStore {
    List<ForwardingRule> loadRules();
    void saveRules(List<ForwardingRule> rules);
}
