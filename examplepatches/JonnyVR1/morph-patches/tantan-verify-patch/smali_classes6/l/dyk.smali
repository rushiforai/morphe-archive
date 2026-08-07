.class public final synthetic Ll/dyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fyk;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$ObjectRef;

.field public final synthetic c:Landroid/media/MediaCodec;

.field public final synthetic d:Lkotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Ll/fyk;Lkotlin/jvm/internal/Ref$ObjectRef;Landroid/media/MediaCodec;Lkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dyk;->a:Ll/fyk;

    iput-object p2, p0, Ll/dyk;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput-object p3, p0, Ll/dyk;->c:Landroid/media/MediaCodec;

    iput-object p4, p0, Ll/dyk;->d:Lkotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dyk;->a:Ll/fyk;

    iget-object v1, p0, Ll/dyk;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v2, p0, Ll/dyk;->c:Landroid/media/MediaCodec;

    iget-object p0, p0, Ll/dyk;->d:Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-static {v0, v1, v2, p0}, Ll/fyk;->C(Ll/fyk;Lkotlin/jvm/internal/Ref$ObjectRef;Landroid/media/MediaCodec;Lkotlin/jvm/internal/Ref$ObjectRef;)V

    return-void
.end method
