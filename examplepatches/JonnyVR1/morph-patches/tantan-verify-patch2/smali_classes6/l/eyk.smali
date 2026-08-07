.class public final synthetic Ll/eyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fyk;

.field public final synthetic b:Landroid/media/MediaCodec;

.field public final synthetic c:Landroid/media/MediaExtractor;


# direct methods
.method public synthetic constructor <init>(Ll/fyk;Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eyk;->a:Ll/fyk;

    iput-object p2, p0, Ll/eyk;->b:Landroid/media/MediaCodec;

    iput-object p3, p0, Ll/eyk;->c:Landroid/media/MediaExtractor;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eyk;->a:Ll/fyk;

    iget-object v1, p0, Ll/eyk;->b:Landroid/media/MediaCodec;

    iget-object p0, p0, Ll/eyk;->c:Landroid/media/MediaExtractor;

    invoke-static {v0, v1, p0}, Ll/fyk;->H(Ll/fyk;Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    return-void
.end method
