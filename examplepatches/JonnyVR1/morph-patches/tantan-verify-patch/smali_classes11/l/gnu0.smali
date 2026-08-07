.class public final synthetic Ll/gnu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lkt0;


# instance fields
.field public final synthetic a:Ll/mnu0;

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ll/mnu0;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gnu0;->a:Ll/mnu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gnu0;->b:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(ZILjava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/gnu0;->a:Ll/mnu0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/gnu0;->b:Ljava/util/Map;

    .line 4
    .line 5
    move v2, p1

    .line 6
    move v3, p2

    .line 7
    move-object v4, p3

    .line 8
    move-object v5, p4

    .line 9
    invoke-virtual/range {v0 .. v5}, Ll/mnu0;->d(Ljava/util/Map;ZILjava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
