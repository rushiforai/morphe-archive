.class public final synthetic Ll/sqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/vqm;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ll/vqm;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sqm;->a:Ll/vqm;

    iput-object p2, p0, Ll/sqm;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/sqm;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sqm;->a:Ll/vqm;

    iget-object v1, p0, Ll/sqm;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/sqm;->c:Landroid/content/Context;

    invoke-static {v0, v1, p0}, Ll/vqm;->a(Ll/vqm;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
