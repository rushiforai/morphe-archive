.class public final synthetic Ll/pyf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/android/app/Frag;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pyf;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/pyf;->b:Lcom/p1/mobile/android/app/Frag;

    iput p3, p0, Ll/pyf;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pyf;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/pyf;->b:Lcom/p1/mobile/android/app/Frag;

    iget p0, p0, Ll/pyf;->c:I

    invoke-static {v0, v1, p0}, Ll/qyf;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    return-void
.end method
