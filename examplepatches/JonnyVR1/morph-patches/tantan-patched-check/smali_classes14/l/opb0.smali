.class public final synthetic Ll/opb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/Class;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/Class;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/opb0;->a:Z

    iput-object p2, p0, Ll/opb0;->b:Ljava/lang/Class;

    iput-boolean p3, p0, Ll/opb0;->c:Z

    iput-boolean p4, p0, Ll/opb0;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/opb0;->a:Z

    iget-object v1, p0, Ll/opb0;->b:Ljava/lang/Class;

    iget-boolean v2, p0, Ll/opb0;->c:Z

    iget-boolean p0, p0, Ll/opb0;->d:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/uqb0;->X(ZLjava/lang/Class;ZZLl/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
