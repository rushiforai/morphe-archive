.class public final Lkog;
.super Lou9;
.source "SourceFile"


# instance fields
.field public final b:Lm20;

.field public final c:I

.field public final d:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lm20;Ljava/lang/String;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkog;->b:Lm20;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lkog;->d:Landroid/net/Uri;

    iput p3, p0, Lkog;->c:I

    return-void
.end method
