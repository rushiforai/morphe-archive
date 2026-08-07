.class public final Ll/wrs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gos0;


# instance fields
.field public final a:Ll/gix0;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/gix0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wrs0;->a:Ll/gix0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wrs0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ll/ewr0;)Ll/gix0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wrs0;->a:Ll/gix0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wrs0;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/gix0;->e(Ljava/lang/String;Ll/ewr0;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/wrs0;->a:Ll/gix0;

    .line 9
    .line 10
    return-object p0
.end method
