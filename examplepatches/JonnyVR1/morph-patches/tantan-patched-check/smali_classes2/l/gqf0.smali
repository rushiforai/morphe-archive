.class public Ll/gqf0;
.super Ll/x6e;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x13
.end annotation


# instance fields
.field public b:Landroid/content/Context;

.field public c:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ll/x6e;Landroid/content/Context;Landroid/net/Uri;)V
    .locals 0
    .param p1    # Ll/x6e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/x6e;-><init>(Ll/x6e;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/gqf0;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p3, p0, Ll/gqf0;->c:Landroid/net/Uri;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gqf0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gqf0;->c:Landroid/net/Uri;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/a7e;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
