package app.johninnl.modelhost.api;

public final class ImageRequest {
    public final TextRequest request;
    public ImageRequest(String operation, String instruction, String languageHint, int maxOutputTokens) {
        if (!"ocr".equals(operation) && !"describe_image".equals(operation)) throw new IllegalArgumentException("Invalid image operation");
        request=new TextRequest(operation,"",instruction,null,languageHint,null,maxOutputTokens,60000);
    }
}
