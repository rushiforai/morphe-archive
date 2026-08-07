.class public final Landroidx/work/d$b$c;
.super Landroidx/work/d$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/d$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Landroidx/work/d$b;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroidx/work/d$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/work/d$b$c;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "SUCCESS"

    .line 2
    .line 3
    return-object p0
.end method
