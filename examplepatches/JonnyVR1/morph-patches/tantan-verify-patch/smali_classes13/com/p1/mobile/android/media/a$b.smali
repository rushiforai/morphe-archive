.class public final Lcom/p1/mobile/android/media/a$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/media/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/p1/mobile/android/media/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/android/media/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/media/a;-><init>(Ll/ja1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/p1/mobile/android/media/a$b;->INSTANCE:Lcom/p1/mobile/android/media/a;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Lcom/p1/mobile/android/media/a;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/media/a$b;->INSTANCE:Lcom/p1/mobile/android/media/a;

    return-object v0
.end method
