.class public final synthetic Ll/nma0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Frag;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Frag;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nma0;->a:Lcom/p1/mobile/android/app/Frag;

    iput p2, p0, Ll/nma0;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nma0;->a:Lcom/p1/mobile/android/app/Frag;

    iget p0, p0, Ll/nma0;->b:I

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/oma0;->S(Lcom/p1/mobile/android/app/Frag;ILl/uxj0;)V

    return-void
.end method
