.class final Le/e/a/Quality195$State;
.super Ljava/lang/Object;
.source "Quality195.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Quality195;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field generation:I

.field pending:Z

.field player:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field position:J

.field resume:Z

.field video:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/Quality195$State;->player:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/Quality195$State;)V
    .registers 2

    .line 15
    invoke-direct {p0}, Le/e/a/Quality195$State;-><init>()V

    return-void
.end method
