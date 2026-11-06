(function() {
    P = nativeModuleProxy.Purchasely;
    P._originalUserSubscriptions = P.userSubscriptions;
    P.userSubscriptions = function () {
        replLog('🎭 userSubscriptions called - returning dummy data');
        return Promise.resolve([
            {
                plan: {
                    vendorId: 'premium_monthly',
                    name: 'Premium Monthly',
                    type: 'auto_renewable_subscription',
                    price: '$9.99'
                },
                product: {
                    vendorId: 'premium_product',
                    name: 'Premium Access'
                },
                subscriptionStatus: 'ACTIVE',
                purchaseToken: 'dummy_token_12345',
                originalPurchaseDate: '2026-01-01T00:00:00Z',
                nextRenewalDate: '2126-02-01T00:00:00Z',
                isTrial: false,
                isActive: true
            }
        ]);
    };
})();
