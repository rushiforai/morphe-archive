.class public final synthetic Ll/dbf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jbf;


# direct methods
.method public synthetic constructor <init>(Ll/jbf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dbf;->a:Ll/jbf;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dbf;->a:Ll/jbf;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    invoke-static {p0, p1}, Ll/jbf;->X(Ll/jbf;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;)V

    return-void
.end method
