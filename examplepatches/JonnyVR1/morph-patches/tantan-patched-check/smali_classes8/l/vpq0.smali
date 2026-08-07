.class public final synthetic Ll/vpq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k9e;


# instance fields
.field public final synthetic a:Ll/xpq0;


# direct methods
.method public synthetic constructor <init>(Ll/xpq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vpq0;->a:Ll/xpq0;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vpq0;->a:Ll/xpq0;

    invoke-static {p0, p1, p2, p3}, Ll/xpq0;->n(Ll/xpq0;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method
