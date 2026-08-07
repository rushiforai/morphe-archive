.class public final synthetic Ll/ovf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ewi;


# direct methods
.method public synthetic constructor <init>(Ll/ewi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ovf;->a:Ll/ewi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ovf;->a:Ll/ewi;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->d(Ll/ewi;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
