.class public final synthetic Ll/qe80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field public final synthetic a:Ll/re80;


# direct methods
.method public synthetic constructor <init>(Ll/re80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qe80;->a:Ll/re80;

    return-void
.end method


# virtual methods
.method public final onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qe80;->a:Ll/re80;

    invoke-static {p0, p1}, Ll/re80;->h(Ll/re80;Landroid/media/MediaPlayer;)V

    return-void
.end method
