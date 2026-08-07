.class public final synthetic Ll/xop;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yop;


# direct methods
.method public synthetic constructor <init>(Ll/yop;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xop;->a:Ll/yop;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xop;->a:Ll/yop;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/yop;->c(Ll/yop;Ljava/lang/Boolean;)V

    return-void
.end method
