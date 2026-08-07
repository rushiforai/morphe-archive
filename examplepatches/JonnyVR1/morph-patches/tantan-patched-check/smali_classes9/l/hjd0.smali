.class public final synthetic Ll/hjd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ljd0;

.field public final synthetic b:Ll/qwl;


# direct methods
.method public synthetic constructor <init>(Ll/ljd0;Ll/qwl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hjd0;->a:Ll/ljd0;

    iput-object p2, p0, Ll/hjd0;->b:Ll/qwl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hjd0;->a:Ll/ljd0;

    iget-object p0, p0, Ll/hjd0;->b:Ll/qwl;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/ljd0;->o4(Ll/ljd0;Ll/qwl;Ljava/lang/Boolean;)V

    return-void
.end method
