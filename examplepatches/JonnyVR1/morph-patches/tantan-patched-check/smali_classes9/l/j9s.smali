.class public final synthetic Ll/j9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/f9e;

.field public final synthetic b:Ll/n9s;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/f9e;Ll/n9s;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9s;->a:Ll/f9e;

    iput-object p2, p0, Ll/j9s;->b:Ll/n9s;

    iput-object p3, p0, Ll/j9s;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/j9s;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/j9s;->a:Ll/f9e;

    iget-object v1, p0, Ll/j9s;->b:Ll/n9s;

    iget-object v2, p0, Ll/j9s;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/j9s;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/n9s;->g(Ll/f9e;Ll/n9s;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
