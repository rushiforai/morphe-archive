.class public final synthetic Ll/r450;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/s450;


# direct methods
.method public synthetic constructor <init>(Ll/s450;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r450;->a:Ll/s450;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r450;->a:Ll/s450;

    invoke-static {p0}, Ll/s450;->a(Ll/s450;)Landroid/widget/FrameLayout;

    move-result-object p0

    return-object p0
.end method
