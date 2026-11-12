.class public interface abstract Lwx3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final Go:Lulp;

.field public static final Ho:Lpsp;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lulp;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Lulp;-><init>(B)V

    sput-object v0, Lwx3;->Go:Lulp;

    new-instance v0, Lpsp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwx3;->Ho:Lpsp;

    return-void
.end method


# virtual methods
.method public abstract o(Lb2l;)Lb2l;
.end method
