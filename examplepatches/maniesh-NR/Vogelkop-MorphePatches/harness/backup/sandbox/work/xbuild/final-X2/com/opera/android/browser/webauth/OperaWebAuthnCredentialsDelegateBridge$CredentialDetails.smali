.class public final Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CredentialDetails"
.end annotation


# instance fields
.field public final a:[B

.field public final b:[B

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>([BLjava/lang/String;Ljava/lang/String;[B)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;->a:[B

    iput-object p4, p0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;->b:[B

    iput-object p2, p0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;->c:Ljava/lang/String;

    iput-object p3, p0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;->d:Ljava/lang/String;

    return-void
.end method
