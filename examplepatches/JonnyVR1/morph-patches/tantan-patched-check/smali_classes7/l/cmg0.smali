.class public final Ll/cmg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/nsg0;

.field public final b:Ll/osg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/olg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nsg0;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Ll/nsg0;-><init>(Landroid/content/Context;Ll/olg0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/cmg0;->a:Ll/nsg0;

    .line 10
    .line 11
    new-instance v0, Ll/osg0;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Ll/osg0;-><init>(Landroid/content/Context;Ll/olg0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/cmg0;->b:Ll/osg0;

    .line 17
    .line 18
    return-void
.end method
