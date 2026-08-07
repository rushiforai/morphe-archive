.class public final synthetic Ll/i880;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i880;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i880;->a:Ljava/lang/String;

    check-cast p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    invoke-static {p0, p1}, Ll/p880;->q1(Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
