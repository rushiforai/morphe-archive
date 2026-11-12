.class public abstract Lcom/opera/android/aiassistant/db/AiAssistantDatabase;
.super Ly5i;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\'\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/aiassistant/db/AiAssistantDatabase;",
        "Ly5i;",
        "<init>",
        "()V",
        "aiassistant"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final l:Lczd;

.field public static final m:Lczd;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lczd;

    const/16 v1, 0xa

    const/4 v2, 0x1

    const/4 v3, 0x2

    invoke-direct {v0, v2, v3, v1}, Lczd;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/aiassistant/db/AiAssistantDatabase;->l:Lczd;

    new-instance v0, Lczd;

    const/4 v1, 0x3

    const/16 v2, 0xb

    invoke-direct {v0, v3, v1, v2}, Lczd;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/aiassistant/db/AiAssistantDatabase;->m:Lczd;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ly5i;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract x()Lrv0;
.end method
