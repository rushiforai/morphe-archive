.class public abstract Lcom/opera/android/autofill/AutofillItem;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final getGuid()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    return-object p0
.end method
