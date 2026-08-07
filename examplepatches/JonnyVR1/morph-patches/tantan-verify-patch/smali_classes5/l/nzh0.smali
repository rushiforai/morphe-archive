.class public final synthetic Ll/nzh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/wzh0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/wzh0$c;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/wzh0;Ljava/lang/String;Ll/wzh0$c;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nzh0;->a:Ll/wzh0;

    iput-object p2, p0, Ll/nzh0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/nzh0;->c:Ll/wzh0$c;

    iput-boolean p4, p0, Ll/nzh0;->d:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nzh0;->a:Ll/wzh0;

    iget-object v1, p0, Ll/nzh0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/nzh0;->c:Ll/wzh0$c;

    iget-boolean p0, p0, Ll/nzh0;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/wzh0;->a(Ll/wzh0;Ljava/lang/String;Ll/wzh0$c;Z)V

    return-void
.end method
