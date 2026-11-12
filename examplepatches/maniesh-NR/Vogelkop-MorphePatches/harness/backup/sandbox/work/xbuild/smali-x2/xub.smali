.class public abstract Lxub;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lwub;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lwu5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lwub;

    invoke-direct {v1, v0}, Lwub;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lxub;->a:Lwub;

    return-void
.end method
