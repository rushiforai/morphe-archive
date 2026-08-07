.class public final synthetic Ll/kca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jka;


# direct methods
.method public synthetic constructor <init>(Ll/jka;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kca;->a:Ll/jka;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kca;->a:Ll/jka;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    invoke-static {p0, p1}, Ll/jka;->B4(Ll/jka;Lcom/p1/mobile/putong/feed/data/VoiceLive;)V

    return-void
.end method
