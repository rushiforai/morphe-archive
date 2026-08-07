.class public final synthetic Ll/yph0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yph0;->a:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yph0;->a:Ll/y20;

    invoke-static {p0, p1}, Ll/aqh0;->f(Ll/y20;Landroid/media/MediaPlayer;)V

    return-void
.end method
