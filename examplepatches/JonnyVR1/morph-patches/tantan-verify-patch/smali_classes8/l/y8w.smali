.class public final synthetic Ll/y8w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y8w;->a:Lcom/p1/mobile/android/app/Act;

    iput p2, p0, Ll/y8w;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y8w;->a:Lcom/p1/mobile/android/app/Act;

    iget p0, p0, Ll/y8w;->b:I

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/haw;->l(Lcom/p1/mobile/android/app/Act;ILl/pf60;)V

    return-void
.end method
