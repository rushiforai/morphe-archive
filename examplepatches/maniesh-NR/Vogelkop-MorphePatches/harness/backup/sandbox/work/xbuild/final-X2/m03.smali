.class public final synthetic Lm03;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lcr9;


# static fields
.field public static final a:Lm03;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lm03;

    const-string v4, "<init>(Lcom/opera/android/wallpaper/Wallpaper;Lcom/opera/android/utilities/ConfigurationInfo;Lcom/opera/android/browser/SystemBarsInset;)V"

    const/4 v5, 0x0

    const/4 v1, 0x3

    const-class v2, Ll03;

    const-string v3, "<init>"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lm03;->a:Lm03;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lqjn;

    check-cast p2, Lkl5;

    check-cast p3, Ljzk;

    new-instance p0, Ll03;

    invoke-direct {p0, p1, p2, p3}, Ll03;-><init>(Lqjn;Lkl5;Ljzk;)V

    return-object p0
.end method
