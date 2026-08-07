.class public final synthetic Ll/ko7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/no7;


# direct methods
.method public synthetic constructor <init>(Ll/no7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ko7;->a:Ll/no7;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ko7;->a:Ll/no7;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/no7;->o3(Ll/no7;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
