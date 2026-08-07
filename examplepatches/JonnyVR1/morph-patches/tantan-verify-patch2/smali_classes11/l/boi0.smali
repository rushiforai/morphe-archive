.class public final Ll/boi0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/Executor;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public static final b:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/hyy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hyy0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/boi0;->a:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    new-instance v0, Ll/qwy0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/qwy0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/boi0;->b:Ljava/util/concurrent/Executor;

    .line 14
    .line 15
    return-void
.end method
