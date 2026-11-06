package slick.android;

final class Accounts {
  static String scope(Object account) throws ReflectiveOperationException {
    String team =
        (String)
            Class.forName("slack.foundation.identity.TeamId")
                .getMethod("getId")
                .invoke(Host.get(account, "team"));
    String user = Host.string(account, "user");
    if (team == null || !team.matches("[A-Z0-9]+") || !user.matches("[UW][A-Z0-9]+"))
      throw new IllegalArgumentException("Missing account/workspace identity");
    return team + ":" + user;
  }
}
