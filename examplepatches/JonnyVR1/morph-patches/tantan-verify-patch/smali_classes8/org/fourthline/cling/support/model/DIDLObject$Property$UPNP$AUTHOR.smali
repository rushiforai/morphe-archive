.class public Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$AUTHOR;
.super Lorg/fourthline/cling/support/model/DIDLObject$Property$PropertyPersonWithRole;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$NAMESPACE;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AUTHOR"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lorg/fourthline/cling/support/model/DIDLObject$Property$PropertyPersonWithRole;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/PersonWithRole;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lorg/fourthline/cling/support/model/DIDLObject$Property$PropertyPersonWithRole;-><init>(Lorg/fourthline/cling/support/model/PersonWithRole;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
