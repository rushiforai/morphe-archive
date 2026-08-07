.class public final synthetic Ll/c19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/d19;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/d19;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c19;->a:Ll/d19;

    iput-object p2, p0, Ll/c19;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/c19;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c19;->a:Ll/d19;

    iget-object v1, p0, Ll/c19;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/c19;->c:Z

    invoke-static {v0, v1, p0}, Ll/d19;->v3(Ll/d19;Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
