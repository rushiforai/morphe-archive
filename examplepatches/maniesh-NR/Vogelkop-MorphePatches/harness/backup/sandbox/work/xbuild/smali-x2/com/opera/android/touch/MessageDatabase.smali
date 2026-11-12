.class abstract Lcom/opera/android/touch/MessageDatabase;
.super Ly5i;
.source "SourceFile"


# static fields
.field public static final l:Lczd;

.field public static final m:Lczd;

.field public static final n:Lczd;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lczd;

    const/16 v1, 0x1b

    const/4 v2, 0x1

    const/4 v3, 0x2

    invoke-direct {v0, v2, v3, v1}, Lczd;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/touch/MessageDatabase;->l:Lczd;

    new-instance v0, Lczd;

    const/16 v1, 0x1c

    const/4 v2, 0x3

    invoke-direct {v0, v3, v2, v1}, Lczd;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/touch/MessageDatabase;->m:Lczd;

    new-instance v0, Lczd;

    const/4 v1, 0x4

    const/16 v3, 0x1d

    invoke-direct {v0, v2, v1, v3}, Lczd;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/touch/MessageDatabase;->n:Lczd;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ly5i;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract x()Ljvd;
.end method
