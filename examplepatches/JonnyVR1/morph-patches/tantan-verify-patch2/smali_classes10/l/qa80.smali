.class public final synthetic Ll/qa80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ra80;

.field public final synthetic b:Ll/ja80;


# direct methods
.method public synthetic constructor <init>(Ll/ra80;Ll/ja80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qa80;->a:Ll/ra80;

    iput-object p2, p0, Ll/qa80;->b:Ll/ja80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qa80;->a:Ll/ra80;

    iget-object p0, p0, Ll/qa80;->b:Ll/ja80;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/ra80;->q(Ll/ra80;Ll/ja80;Ljava/lang/Integer;)V

    return-void
.end method
