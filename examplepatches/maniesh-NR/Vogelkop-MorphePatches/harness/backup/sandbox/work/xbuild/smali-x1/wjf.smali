.class public abstract Lwjf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/List;

.field public static final b:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sput-object v0, Lwjf;->a:Ljava/util/List;

    sput-object v0, Lwjf;->b:Ljava/util/List;

    return-void
.end method
