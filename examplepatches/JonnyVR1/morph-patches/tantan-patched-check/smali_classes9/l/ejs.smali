.class public final synthetic Ll/ejs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gjs;

.field public final synthetic b:Ll/gjs$a;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/gjs;Ll/gjs$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ejs;->a:Ll/gjs;

    iput-object p2, p0, Ll/ejs;->b:Ll/gjs$a;

    iput-object p3, p0, Ll/ejs;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ejs;->a:Ll/gjs;

    iget-object v1, p0, Ll/ejs;->b:Ll/gjs$a;

    iget-object p0, p0, Ll/ejs;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/gjs$a;->e(Ll/gjs;Ll/gjs$a;Ljava/lang/String;)V

    return-void
.end method
