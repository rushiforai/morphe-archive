.class public final synthetic Ll/bzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ezj;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/ezj;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bzj;->a:Ll/ezj;

    iput p2, p0, Ll/bzj;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bzj;->a:Ll/ezj;

    iget p0, p0, Ll/bzj;->b:I

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/ezj;->X3(Ll/ezj;ILjava/lang/Long;)V

    return-void
.end method
