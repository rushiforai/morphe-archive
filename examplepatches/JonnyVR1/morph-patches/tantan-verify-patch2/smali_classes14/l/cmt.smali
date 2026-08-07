.class public final synthetic Ll/cmt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ylt;


# direct methods
.method public synthetic constructor <init>(Ll/ylt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cmt;->a:Ll/ylt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cmt;->a:Ll/ylt;

    check-cast p1, Ll/olt;

    invoke-virtual {p0, p1}, Ll/ylt;->T2(Ll/olt;)V

    return-void
.end method
