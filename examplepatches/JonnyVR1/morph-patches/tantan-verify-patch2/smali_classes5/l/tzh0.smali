.class public final synthetic Ll/tzh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/wzh0$a;

.field public final synthetic b:Ll/wzh0$d;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/wzh0$a;Ll/wzh0$d;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tzh0;->a:Ll/wzh0$a;

    iput-object p2, p0, Ll/tzh0;->b:Ll/wzh0$d;

    iput-boolean p3, p0, Ll/tzh0;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tzh0;->a:Ll/wzh0$a;

    iget-object v1, p0, Ll/tzh0;->b:Ll/wzh0$d;

    iget-boolean p0, p0, Ll/tzh0;->c:Z

    invoke-static {v0, v1, p0}, Ll/wzh0$a;->c(Ll/wzh0$a;Ll/wzh0$d;Z)V

    return-void
.end method
