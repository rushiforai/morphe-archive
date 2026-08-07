.class public final synthetic Ll/hhh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uih0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/uih0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hhh0;->a:Ll/uih0;

    iput-boolean p2, p0, Ll/hhh0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hhh0;->a:Ll/uih0;

    iget-boolean p0, p0, Ll/hhh0;->b:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/uih0;->d(Ll/uih0;ZLl/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
