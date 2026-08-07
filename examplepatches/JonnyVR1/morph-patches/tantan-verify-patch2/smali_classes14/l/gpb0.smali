.class public final synthetic Ll/gpb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/Class;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gpb0;->a:Ljava/lang/Class;

    iput-boolean p2, p0, Ll/gpb0;->b:Z

    iput-boolean p3, p0, Ll/gpb0;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gpb0;->a:Ljava/lang/Class;

    iget-boolean v1, p0, Ll/gpb0;->b:Z

    iget-boolean p0, p0, Ll/gpb0;->c:Z

    invoke-static {v0, v1, p0}, Ll/uqb0;->y(Ljava/lang/Class;ZZ)Lrx/c;

    move-result-object p0

    return-object p0
.end method
