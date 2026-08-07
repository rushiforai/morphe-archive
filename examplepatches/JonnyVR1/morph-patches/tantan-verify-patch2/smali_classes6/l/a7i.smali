.class public final synthetic Ll/a7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/f7i;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/f7i;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a7i;->a:Ll/f7i;

    iput-object p2, p0, Ll/a7i;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/a7i;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a7i;->a:Ll/f7i;

    iget-object v1, p0, Ll/a7i;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/a7i;->c:Z

    invoke-static {v0, v1, p0}, Ll/f7i;->c(Ll/f7i;Ljava/lang/String;Z)V

    return-void
.end method
