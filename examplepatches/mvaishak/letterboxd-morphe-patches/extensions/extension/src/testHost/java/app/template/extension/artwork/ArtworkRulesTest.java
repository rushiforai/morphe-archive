package app.template.extension.artwork;

public final class ArtworkRulesTest {
    public static void main(String[] args) {
        require(ArtworkRules.imageUrl(" https://image.tmdb.org/t/p/original/test.jpg ")
                .equals("https://image.tmdb.org/t/p/original/test.jpg"));
        for (String invalid : new String[]{"file:///data/local.jpg", "content://photo/1",
                "javascript:alert(1)", "https://user:pass@example.com/image", "https:///image",
                "http://localhost/x", "https://example.com/image#fragment", ""}) {
            require(ArtworkRules.imageUrl(invalid) == null);
        }
        require(ArtworkRules.ownsProfile("abc", "abc"));
        require(!ArtworkRules.ownsProfile("abc", "ABC"));
        require(!ArtworkRules.ownsProfile(null, null));
        require(!ArtworkRules.ownsProfile("", ""));
        require(!ArtworkRules.ownsProfile("alice", "bob"));
        require(ArtworkRules.keyProblem("") != null);
        require(ArtworkRules.keyProblem("eyJhbGciOiJIUzI1NiJ9.abc.def").contains("Read Access Token"));
        require(ArtworkRules.keyProblem("1234567890abcdef1234567890abcdef") == null);
        require(ArtworkRules.useLocalArtwork("automatic", false));
        require(!ArtworkRules.useLocalArtwork("automatic", true));
        require(ArtworkRules.useLocalArtwork("local", true));
        require(ArtworkRules.useLocalArtwork("local", false));
        require(!ArtworkRules.useLocalArtwork("off", false));
        require(!ArtworkRules.useLocalArtwork("off", true));
        require(!ArtworkRules.useLocalArtwork("unknown", true));
        System.out.println("Artwork rules passed");
    }

    private static void require(boolean condition) {
        if (!condition) throw new AssertionError();
    }
}
