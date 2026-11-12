.class public final Lorg/chromium/content_public/common/ResourceRequestBody;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[B


# direct methods
.method public constructor <init>([B)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/chromium/content_public/common/ResourceRequestBody;->a:[B

    return-void
.end method

.method public static createFromEncodedNativeForm([B)Lorg/chromium/content_public/common/ResourceRequestBody;
    .registers 2

    new-instance v0, Lorg/chromium/content_public/common/ResourceRequestBody;

    invoke-direct {v0, p0}, Lorg/chromium/content_public/common/ResourceRequestBody;-><init>([B)V

    return-object v0
.end method


# virtual methods
.method public final getEncodedNativeForm()[B
    .registers 1

    iget-object p0, p0, Lorg/chromium/content_public/common/ResourceRequestBody;->a:[B

    return-object p0
.end method
