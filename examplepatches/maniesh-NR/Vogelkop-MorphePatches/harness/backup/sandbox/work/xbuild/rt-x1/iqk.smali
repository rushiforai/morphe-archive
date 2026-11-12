.class public interface abstract Liqk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final Bp:Lioj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lioj;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lioj;-><init>(B)V

    sput-object v0, Liqk;->Bp:Lioj;

    return-void
.end method


# virtual methods
.method public abstract l(Lpvb;Z)V
.end method

.method public abstract q(Lcom/opera/android/suggestion/Suggestion;Z)V
.end method
