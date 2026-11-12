.class public interface abstract Lwom;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final Gp:Lauj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lauj;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lauj;-><init>(B)V

    sput-object v0, Lwom;->Gp:Lauj;

    return-void
.end method


# virtual methods
.method public abstract c()V
.end method

.method public abstract d()Z
.end method
