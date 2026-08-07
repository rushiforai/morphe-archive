.class public final Ll/lju0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/fmu0;

.field public final b:Ll/xhs0;


# direct methods
.method public constructor <init>(Ll/fmu0;Ll/xhs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lju0;->a:Ll/fmu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lju0;->b:Ll/xhs0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/xhs0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lju0;->b:Ll/xhs0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/fmu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lju0;->a:Ll/fmu0;

    .line 2
    .line 3
    return-object p0
.end method
